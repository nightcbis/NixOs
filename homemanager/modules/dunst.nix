{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 1;
	follow = "none";
	timeout = 5;
      };
      urgency_low = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
      urgency_normal = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
      urgency_critical = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
    };
  };
}
