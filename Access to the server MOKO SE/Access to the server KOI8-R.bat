@echo off

chcp 20866 > nul

echo Выполняем команды netsh...

netsh http add urlacl url=http://+:55001/MOKOSE/stage/stagewrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/autoitwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/autoitread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/driverwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/driverread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/pluginwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/pluginread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/messengerwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/messengerread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/reportwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/reportread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/programwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/programread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/utilitywrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/utilityread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/telegramwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/telegramread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/cmdwrite/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/cmdread/ user=Все
netsh http add urlacl url=http://+:55001/MOKOSE/system/projectstate/ user=Все

echo Готово.

pause
