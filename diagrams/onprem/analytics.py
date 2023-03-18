from custom.remote import RemoteCustom


class Airbyte(RemoteCustom):
    """FIXME: Use node from diagrams when available. See https://github.com/mingrammer/diagrams/issues/457 for more information."""

    def __init__(self):
        super().__init__(
            name="airbyte",
            url="https://assets.website-files.com/605e01bc25f7e19a82e74788/60895f8dfc189968c33b89d2_airbyte_rounded-rectangle_icon-p1myrdbsr61z7375uuocdxnlmab85b8vry3h73pfk0.png",
        )


class Dbt(RemoteCustom):
    """Using a proper dbt icon."""

    def __init__(self):
        super().__init__(
            name="dbt",
            url="https://docs.google.com/uc?export=download&id=1fnsWHRu2a_UkJBJgkZtqt99x5bSyf3Aw",
            file_extension=".png",
        )


class Superset(RemoteCustom):
    """Using a proper superset icon."""

    def __init__(self):
        super().__init__(
            name="superset",
            url="https://www.apache.org/logos/res/superset/superset-2.png",
        )
