from requests import Session
from requests.auth import HTTPBasicAuth
from zeep import Settings, Transport, Client
from django.conf import settings

class WebService:

    PRODUCT_SEARCH = settings.WEBSERVICE['PRODUCT_SEARCH']
    # CURIER_DATA = settings.WEBSERVICE['PRODUCT_SEARCH']
    client = None

    def __init__(self,func):
        # self.func = func

        session = Session()
        lsettings = Settings(strict=False, xml_huge_tree=True)
        transport = Transport(session=session, timeout=10, cache=None)
        session.auth = HTTPBasicAuth(settings.WEBSERVICE['USER'], settings.WEBSERVICE['PASSWORD'])
        # session.headers = {"Content-Type": "text/xml; charset=utf-8"}
        self.client = Client(settings.WEBSERVICE['HOST'] + func, transport=transport, settings=lsettings)

    def getStoragePrice(self,codes):

        if self.client is None:
            result = []
        else:
            try:
                # with client.settings(raw_response=True):
                result = self.client.service.SearchByCodes(ClientCode='1454',
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