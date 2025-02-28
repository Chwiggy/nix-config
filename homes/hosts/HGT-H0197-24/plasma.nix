{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.plasma.powerdevil = {
    AC = {
      autoSuspend.action = "sleep";
      whenLaptopLidClosed = "sleep";
      whenSleepingEnter = "standby";
    };
    battery = {
      autoSuspend.action = "sleep";
      whenLaptopLidClosed = "sleep";
      whenSleepingEnter = "standby";
    };
    lowBattery = {
      autoSuspend.action = "sleep";
      whenLaptopLidClosed = "sleep";
      whenSleepingEnter = "standby";
    };
  };
}
