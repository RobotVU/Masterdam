
# Using the IBM Bluemix Weather Company API https://console.ng.bluemix.net/docs/services/Weather/weather_rest_apis.html#rest_apis

import requests
import json

def get_weather(zip):
    username = 'username'
    password = 'password'
    
    watsonUrl = 'https://twcservice.mybluemix.net:443/api/weather/v1/geocode/52.37/4.90' + '/observations.json?language=en-US'

    try:
        r = requests.get(watsonUrl,auth=(username,password))
        return r.text
    except:
        return False

def display_weather(results):
    print()
    print('Here is the weather for {0}'.format(results['observation']['obs_name']))
    print('{0:20} {1:<10}'.format('Current Temperature:',str(results['observation']['temp']) + '° and ' + results['observation']['wx_phrase']))
    print('{0:20} {1:<10}'.format('Feels Like: ',str(results['observation']['feels_like']) + '°'))
    print('{0:20} {1:<10}'.format('Low Temp: ',str(results['observation']['min_temp']) + '°'))
    print('{0:20} {1:<10}'.format('High Temp: ',str(results['observation']['max_temp']) + '°'))
    print('{0:20} {1:<10}'.format('Winds:',str(results['observation']['wspd']) + ' mph coming from the ' + results['observation']['wdir_cardinal']))
 
def get_weather():
    results = get_weather()
    if results != False:
        results = json.loads(str(results))
        display_weather(results)
    else:
        print('error')
 
if __name__ == '__main__':
    get_weather()
