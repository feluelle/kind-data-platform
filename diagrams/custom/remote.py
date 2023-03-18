from dataclasses import dataclass
from os.path import splitext
from tempfile import gettempdir
from urllib.parse import urlparse
from urllib.request import urlretrieve

from diagrams.custom import Custom  # type: ignore[attr-defined]


@dataclass
class IconDownloader:
    """
    Help downloading the icon for the a custom node.

    :param name: The name of the custom node.
    :param url: The url to the icon to download.
    :param file_extension: The file extension of the icon.
    """

    name: str
    url: str
    file_extension: str = ""

    def download(self) -> None:
        """Download the icon from the url."""
        icon_path = self.get_icon_path()
        urlretrieve(self.url, icon_path)  # nosec B10:urllib_urlopen

    def get_icon_path(self) -> str:
        """
        Get the local path to the icon.

        :returns: the local path of the icon.
        """
        file_extension = self.file_extension or self._get_file_extension()
        directory = gettempdir()
        return f"{directory}/{self.name}{file_extension}"

    def _get_file_extension(self) -> str:
        path = urlparse(self.url).path
        return splitext(path)[1]


class RemoteCustom(Custom):
    """
    A slim version of the Custom node type which downloads the icon automatically.

    :param name: The name of the custom node.
    :param url: The url to the icon to download.
    :param file_extension: The file extension of the icon.
    """

    def __init__(self, name: str, url: str, file_extension: str = ""):
        icon_downloader = IconDownloader(name, url, file_extension)
        icon_downloader.download()
        super().__init__(label="", icon_path=icon_downloader.get_icon_path())
