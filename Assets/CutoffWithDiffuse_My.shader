Shader "Holistic/CutoffWithDiffuse_My" 
{
	Properties
	{
		_myDiffuse ("Diffuse Texture", 2D) = "white" {}
		_RimColor("Rim Color", Color) = (0,0.5,0.5,0)
		_RimPower("Rim Power", Range(0.5, 8.0)) = 3.0
		_StripeSize("Stripe size", Range(0.1, 5.0)) = 1.0
	}
	SubShader 
	{		
		CGPROGRAM
		
		#pragma surface surf Lambert

		struct Input 
		{
			float2 uv_myDiffuse;  
			float3 viewDir;
			float3 worldPos;
		};

		float4 _RimColor;
		float _RimPower;
		sampler2D _myDiffuse;
		float _StripeSize;

		void surf (Input IN, inout SurfaceOutput o) 
		{
			half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));			
			//o.Emission = rim > 0.5 ? float3(1,0,0): rim > 0.3 ? float3(0,1,0): 0;
			//o.Emission = IN.worldPos.y > 1 ? float3(0,1,0): float3(1,0,0);			
			//o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4 ? float3(0,1,0) : float3(1,0,0);
			o.Albedo = (tex2D(_myDiffuse, IN.uv_myDiffuse)).rgb;
			o.Emission = frac(IN.worldPos.y * 10 * _StripeSize) > 0.4 ? float3(0,1,0) * rim : float3(1,0,0) * rim;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
