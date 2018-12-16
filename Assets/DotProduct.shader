Shader "Holistic/DotProduct" 
{
	SubShader 
	{		
		CGPROGRAM
		
		#pragma surface surf Lambert

		struct Input 
		{
			float3 viewDir;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{
			half dotp = dot(IN.viewDir, o.Normal);
			//o.Albedo = float3(dotp, 1, dotp);
			//o.Albedo.rg = float2(IN.viewDir, 1-dot(IN.viewDir, o.Normal));			
			o.Albedo.gb = float2(1-dotp, 0);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
