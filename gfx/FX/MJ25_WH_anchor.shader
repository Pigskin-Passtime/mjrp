Includes = {
	"buttonstate.fxh"
}

PixelShader =
{
	Samplers =
	{
		MapTexture =
		{
			Index = 0
			MagFilter = "linear"
			MinFilter = "linear"
			MipFilter = "None"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}

		MaskingTexture =
		{
			Index = 5
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "None"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}		
	}
}


VertexStruct VS_OUTPUT
{
	float4  vPosition : PDX_POSITION;
	float2  vScreenPos : TEXCOORD3;
	float2  vTexCoord : TEXCOORD0;
@ifdef MASKING
	float2  vMaskingTexCoord : TEXCOORD2;
@endif	
};


VertexShader =
{
	MainCode VertexShader
		ConstantBuffers = { Common }
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
			VS_OUTPUT Out;
			Out.vPosition  = mul( WorldViewProjectionMatrix, float4( v.vPosition.xyz, 1 ) );
			Out.vScreenPos = Out.vPosition.xy;
		
			Out.vTexCoord = v.vTexCoord;
			Out.vTexCoord += Offset;

		#ifdef MASKING
			//A bit hacky, but we want the masking texture coordinates to be in the range [0,1]. We turn all 0's to 0 and all nonzero to 1.
			Out.vMaskingTexCoord = saturate(v.vTexCoord * 1000);
		#endif

#ifdef PDX_OPENGL
			//Flip texture coordinates so map is not upside down
			Out.vTexCoord.y = 1 - Out.vTexCoord.y;
#endif		
		
			return Out;
		}
	]]
}

PixelShader =
{
	MainCode PixelShader
		ConstantBuffers = { Common }
	[[
		float4 main(VS_OUTPUT v) : PDX_COLOR
		{
			const float rippleFrequency = 10.0;
			const float rippleSpeed = 0.1;
			const float ringWidth = 0.15;
			const float trailWidth = 0.3;
			const int ringCount = 5;
			const float loopRadius = 1.5;

			float2 texCoord = v.vTexCoord;
			float4 TextureColor = tex2D(MapTexture, texCoord);

			float gray = dot(TextureColor.rgb, float3(0.4, 0.3, 0.4));
			float4 PortraitGray = float4(gray, gray, gray, TextureColor.a);

			const float edgeThickness = 0.01;
			const float edgeBoost = 2;
			const float edgeContrast = 1;
			float4 SampleH = tex2D(MapTexture, texCoord + float2(edgeThickness, 0));
			float4 SampleV = tex2D(MapTexture, texCoord + float2(0, edgeThickness));
			float4 EdgeAmount = max(abs(TextureColor - SampleH), abs(TextureColor - SampleV));
			float edgeValue = max(EdgeAmount.r, max(EdgeAmount.g, max(EdgeAmount.b, EdgeAmount.a)));
			edgeValue = pow(edgeValue * edgeBoost, edgeContrast);

			const float4 EdgeColorBoost = float4(0.6, 0.2, 0.6, 1.0);
			float4 EdgesOverlay = saturate(edgeValue * EdgeColorBoost);

			float2 center = float2(0.5, 0.5);
			float dist = distance(texCoord, center);
			float timeFactor = Time * rippleSpeed;

			float ringOpacity = 0.0;

			for (int i = 0; i < ringCount; ++i)
			{
				float offset = (float(i) / ringCount) * loopRadius;
				float currentRadius = fmod(timeFactor + offset, loopRadius);

				float ringDist = abs(dist - currentRadius);

				float phase = sin(-(dist * rippleFrequency - currentRadius * 6.283));

				float ring = saturate(1.0 - smoothstep(0.0, ringWidth, ringDist));
				ring *= (phase * 0.5 + 0.5);
				ring = pow(ring, 2.0);

				float trailStart = currentRadius - trailWidth;
				float trail = smoothstep(0.0, trailWidth, dist - trailStart) * step(trailStart, dist) * step(dist, currentRadius);

				ringOpacity = max(ringOpacity, max(ring, trail));
			}

			float4 PortraitVisible = PortraitGray * ringOpacity;
			float4 OutColor = EdgesOverlay + PortraitVisible;
			OutColor.a = max(EdgesOverlay.a, ringOpacity) * TextureColor.a;
			OutColor *= Color;

		#ifdef MASKING
			float4 MaskColor = tex2D(MaskingTexture, v.vMaskingTexCoord);
			OutColor.a *= MaskColor.a;
		#endif

			return OutColor;
		}
	]]
}

BlendState BlendState
{
	BlendEnable = yes
	SourceBlend = "src_alpha"
	DestBlend = "inv_src_alpha"
}


Effect Up
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect Down
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect Disable
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect Over
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}


