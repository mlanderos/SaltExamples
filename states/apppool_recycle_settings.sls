#!pyobjects
# more info on app pool recycling - https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/applicationpools/add/recycling/#attributes

appPools = __salt__['win_iis.list_apppools']()

for keys in appPools:
  WinIis.webconfiguration_settings(
    'Enable LogOnEventOnRecycle for App Pool "{0}"'.format(keys),
    name="IIS:\\",
    settings={
      'system.applicationHost/applicationPools' : {
          'Collection[{name: ' + keys + '}].recycling.logEventOnRecycle': 'Time,Requests,Schedule,Memory,IsapiUnhealthy,OnDemand,ConfigChange,PrivateMemory'
      }
    }
  )
