from dataclasses import dataclass
from os.path import splitext
from tempfile import gettempdir
from urllib.parse import urlparse
from urllib.request import urlretrieve

from diagrams.custom import Custom


@dataclass
class HelperCustom:
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


class CustomSlim(Custom):
    """
    A slim version of the Custom node type which downloads the icon automatically.

    :param name: The name of the custom node.
    :param url: The url to the icon to download.
    :param file_extension: The file extension of the icon.
    """

    def __init__(self, name: str, url: str, file_extension: str = ""):
        node = HelperCustom(name, url, file_extension)
        node.download()
        super().__init__(label="", icon_path=node.get_icon_path())


class Airbyte(CustomSlim):
    """FIXME: Use node from diagrams when available. See https://github.com/mingrammer/diagrams/issues/457 for more information."""

    def __init__(self):
        super().__init__(
            name="airbyte",
            url="https://assets.website-files.com/605e01bc25f7e19a82e74788/60895f8dfc189968c33b89d2_airbyte_rounded-rectangle_icon-p1myrdbsr61z7375uuocdxnlmab85b8vry3h73pfk0.png",
        )


class Dbt(CustomSlim):
    """Using a proper dbt icon."""

    def __init__(self):
        super().__init__(
            name="dbt",
            url="https://docs.google.com/uc?export=download&id=1fnsWHRu2a_UkJBJgkZtqt99x5bSyf3Aw",
            file_extension=".png",
        )


class Superset(CustomSlim):
    """Using a proper superset icon."""

    def __init__(self):
        super().__init__(
            name="superset",
            url="https://www.apache.org/logos/res/superset/superset-2.png",
        )
