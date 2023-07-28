import urllib.request
from bs4 import BeautifulSoup
import os

os.environ["http_proxy"] = "http://cproxy.okinawa-ct.ac.jp:8080"
os.environ["https_proxy"] = "http://cproxy.okinawa-ct.ac.jp:8080"

acc_list = [
        "GU170821.1",
        "OM869082.1",
        "NC_024513.1",
        "NC_063962.1",
        "NC_002793.1",
        "NC_079968.1",
        "NC_062668.1",
        "NC_002639.1",
        "NC_020465.1",
        "NC_006921.2",
]

def download_nucl_from_acc(_acc):

    query = f"{_acc}[accn]+OR+$"

    base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/'
    query_url = base + f"esearch.fcgi?db=nuccore&term={query}&usehistory=y"

    print(query_url)
    data = urllib.request.urlopen(query_url)
    xml = data.read()
    soup = BeautifulSoup(xml, "xml")
    QueryKey = soup.find("QueryKey").text
    WebEnv = soup.find("WebEnv").text
    print("QueryKey= ",QueryKey)
    print("WebEnv= ",WebEnv)

    query_url2 = base + f"efetch.fcgi?db=nuccore&query_key={QueryKey}&WebEnv={WebEnv}&rettype=fasta&retmode=text"
    print(query_url2)

    urllib.request.urlretrieve(query_url2, f"fasta/{_acc}.fasta")

if __name__ == "__main__":
    for acc in acc_list:
        download_nucl_from_acc(acc)
