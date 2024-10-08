#version 330

layout(location = 0) in vec4 position;


uniform mat4 modelToWorldMatrix;
uniform mat4 worldToClipMatrix;

void main()
{
	vec4 temp = modelToWorldMatrix * position;
	//temp = worldToCameraMatrix * temp;
	// (cameraToClipMatrix*worldToCameraMatrix)*modelToWorldMatrix*position
	gl_Position = worldToClipMatrix * temp;
}
