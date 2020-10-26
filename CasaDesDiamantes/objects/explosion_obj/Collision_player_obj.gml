if (!dealtDamage)
{
	other.hp -= explosionDamage;
	camera_obj.hitVignette = true;
	dealtDamage = true;
}
