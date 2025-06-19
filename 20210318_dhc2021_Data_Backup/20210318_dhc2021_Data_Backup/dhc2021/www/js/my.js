function prgressBarChange(per){
	jQuery("#examLevel .progress-bar").css("width", per+"%").attr("aria-valuenow",per);
	jQuery("#examLevel .progress-bar").html( per+"%");
}