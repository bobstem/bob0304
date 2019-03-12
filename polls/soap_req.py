from requests import Session
from requests.auth import HTTPBasicAuth
from zeep import Settings, Transport, Client


def webClientService():
    host = 'https://status-m.com.ua/ws/ProductSearch_new.1cws?wsdl'
    user = 'wser'
    password = 'a1s2d3f4g5h6'

    session = Session()
    settings = Settings(strict=False, xml_huge_tree=True)
    transport = Transport(session=session, timeout=10, cache=None)
    session.auth = HTTPBasicAuth(user, password)
    # session.headers = {"Content-Type": "text/xml; charset=utf-8"}
    try:
        client = Client(host, transport=transport, settings=settings)
    except:
        client = None

    return client

def webService(codes):
    data = {
            "ClientCode": "1454",
            "Codes": "369360;",
            "ShowOff": "1",
            "ShowNumber": "5000",
            "Sort": "0",
            "Letter":"",
            "ShowOrderGoods": "",
            "Only_GAZ_Products": "0",
    }

    client = webClientService()

    if client is None:
        result = []
    else:
        try:
            # with client.settings(raw_response=True):
            result = client.service.SearchByCodes(ClientCode='1454',
                                                  Codes=codes,
                                                  ShowOff="1",
                                                  ShowNumber="5000",
                                                  Sort="0",
                                                  Letter="",
                                                  ShowOrderGoods="",
                                                  Only_GAZ_Products="0",
                                                  )
        except:
            result = []

    return result