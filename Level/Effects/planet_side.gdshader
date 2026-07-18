shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.

	
}

void fragment() {
	float alpha = ALPHA;
	if(alpha > 0.0){
	
	alpha -= 0.01 * TIME;
	
	}
	ALPHA = alpha;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
