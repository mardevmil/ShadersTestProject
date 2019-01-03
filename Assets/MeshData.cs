using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeshData : MonoBehaviour
{

	void Start ()
	{
	    Mesh mesh = GetComponent<MeshFilter>().mesh;
	    Vector3[] vertices = mesh.vertices;
	    foreach (var v in vertices)
	    {
	        Debug.Log(v);
	    }
	}	
}
