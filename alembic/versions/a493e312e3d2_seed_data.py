"""Seed data

Revision ID: a493e312e3d2
Revises: c807e528bec6
Create Date: 2026-04-12 01:57:29.822970

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'a493e312e3d2'
down_revision: Union[str, Sequence[str], None] = 'c807e528bec6'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.execute()



def downgrade() -> None:
    """Downgrade schema."""
    pass
