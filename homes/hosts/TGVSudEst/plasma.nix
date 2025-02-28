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
      whenSleepingEnter = "standbyThenHibernate";
    };
    battery = {
      autoSuspend.action = "sleep";
      whenLaptopLidClosed = "hibernate";
      whenSleepingEnter = "standbyThenHibernate";
    };
    lowBattery = {
      autoSuspend.action = "sleep";
      whenLaptopLidClosed = "hibernate";
      whenSleepingEnter = "standbyThenHibernate";
    };
  };
}
