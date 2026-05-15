@echo off

chcp 866 > nul

echo Выполняем команды netsh...

netsh http add urlacl url=http://+:55001/SE/stage/stagewrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/autoitwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/autoitread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/driverwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/driverread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/pluginwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/pluginread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/messengerwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/messengerread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/reportwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/reportread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/programwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/programread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/utilitywrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/utilityread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/telegramwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/telegramread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/cmdwrite/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/cmdread/ user=Все
netsh http add urlacl url=http://+:55001/SE/system/projectstate/ user=Все

echo Готово.

pause
