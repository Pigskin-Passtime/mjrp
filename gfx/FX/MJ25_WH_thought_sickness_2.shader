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
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float2 texCoord = v.vTexCoord;
			float4 TextureColor = tex2D(MapTexture, texCoord);

			const float vEdgeThickness = 0.01;
			const float vEdgeBoost = 2;
			const float vEdgeContrast = 1;
			float4 SampleH = tex2D(MapTexture, texCoord + float2(vEdgeThickness, 0));
			float4 SampleV = tex2D(MapTexture, texCoord + float2(0, vEdgeThickness));
			float4 EdgeAmount = max(abs(TextureColor - SampleH), abs(TextureColor - SampleV));
			float vEdgeAmount = max(EdgeAmount.r, max(EdgeAmount.g, max(EdgeAmount.b, EdgeAmount.a)));
			vEdgeAmount = pow(vEdgeAmount * vEdgeBoost, vEdgeContrast);

			const float4 vEdgeColorBoost = float4(0.6, 0.2, 0.6, 1.0); 
			float4 EdgesOverlay = saturate(vEdgeAmount * vEdgeColorBoost);

			float4 OutColor = EdgesOverlay;
			OutColor.a *= TextureColor.a; 

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


