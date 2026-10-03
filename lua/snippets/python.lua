require("luasnip.session.snippet_collection").clear_snippets("python")

local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("python", {
    s(
        "workflow",
        fmta(
            [[
from loguru import logger
from pydantic import BaseModel

from mazlo.database.context.data_context import DataContext
from mazlo.utils.db_utils import must
from mazlo.vendor.synctera_client import SyncteraClient
from mazlo.workflow.workflow import workflow


class <workflow_name>Args(BaseModel):
    <args_list>


@workflow
async def <workflow_fn_name>(arg: <workflow_name_same>Args, data_context: DataContext, synctera_client: SyncteraClient):
    <finish>
      ]],
            {
                workflow_name = i(1),
                workflow_name_same = rep(1),
                workflow_fn_name = i(2),
                args_list = i(3),
                finish = i(0),
            }
        )
    ),
    s(
        "mm",
        fmta(
            [[
<module_name> = module_mocker(<workflow>, "<module_name_same>")
<finish>
      ]],
            {
                module_name = i(1),
                module_name_same = rep(1),
                workflow = i(2),
                finish = i(0),
            }
        )
    ),
    s(
        "api-post",
        fmta(
            [[
class <body_same>Body(BaseModel):
    <finish>


@router.post("<route>")
async def <route_fn>(
    body: <body>Body,
    data_context: DataContext = Depends(get_data_context),
):
    pass
      ]],
            {
                route = i(1),
                route_fn = i(2),
                body = i(3),
                body_same = rep(3),
                finish = i(0),
            }
        )
    ),
    s(
        "api-get",
        fmta(
            [[
@router.get("<route>")
async def <route_fn>(data_context: DataContext = Depends(get_data_context)):
    pass
    <finish>
      ]],
            {
                route = i(1),
                route_fn = i(2),
                finish = i(0),
            }
        )
    ),
    s(
        "testunit",
        fmta(
            [[
@pytest.mark.parametrize(
    "",
    [
      "",
    ],
)
async def test_<fn_name>(mocker, module_mocker, user_data_context: DataContext, mock_synctera_client):
    # Arrange
    <finish>

    # Act

    # Assert
      ]],
            {
                fn_name = i(1),
                finish = i(0),
            }
        )
    ),
    s(
        "db",
        fmta(
            [[
async def <fn_name>(data_context: DataContext, <args>):
    async with data_context.get_cursor() as cur:
        <finish>
        await cur.execute(
            """
            """,
        )
      ]],
            {
                fn_name = i(1),
                args = i(2),
                finish = i(0),
            }
        )
    ),
    s(
        "db-insert",
        fmta(
            [[
async def <fn_name>(data_context: DataContext, <args>) ->> str:
    <public_id>_id = internal_id()

    async with data_context.get_cursor() as cur:
        await cur.execute(
            """
            insert into <table> (
                <table_cols>
            )
            values (
                <table_values>
            )
            """,
            (<query_args>,),
        )

    return <public_id_same>_id
<finish>
            ]],
            {
                fn_name = i(1),
                args = i(2),
                public_id = i(3),
                public_id_same = rep(3),
                table = i(4),
                table_cols = i(5),
                table_values = i(6),
                query_args = i(7),
                finish = i(0),
            }
        )
    ),
    s(
        "db-select",
        fmta(
            [[
async def <fn_name>(data_context: DataContext, <args>) ->> <fn_return> | None:
    async with data_context.get_cursor() as cur:
        await cur.execute(
            """
            select
                <table_cols>
            from
                <table_name>
            where
                <where_clause>
            """,
            (<query_args>,),
        )
        row = await cur.fetchone()
        if not row:
            return None
    return row[0]<finish>
            ]],
            {
                fn_name = i(1),
                args = i(2),
                fn_return = i(3),
                table_cols = i(4),
                table_name = i(5),
                where_clause = i(6),
                query_args = i(7),
                finish = i(0),
            }
        )
    ),
    s(
        "db-update",
        fmta(
            [[
async def <fn_name>(data_context: DataContext, <args>):
    async with data_context.get_cursor() as cur:
        <fk>
        await cur.execute(
            """
            update <table_name> set
                <table_cols>
            where
                <where_clause>
            """,
            (<finish>,),
        )
            ]],
            {
                fn_name = i(1),
                args = i(2),
                table_name = i(3),
                table_cols = i(4),
                where_clause = i(5),
                fk = i(6),
                finish = i(0),
            }
        )
    ),
    s(
        "idmap",
        fmta(
            [[
        <table>_row_id = await id_map.get_<table_3>_row_id(cur, <table_1>_id)
        assert <table_2>_row_id
        <finish>
            ]],
            {
                table = i(1),
                table_1 = rep(1),
                table_2 = rep(1),
                table_3 = rep(1),
                finish = i(0),
            }
        )
    ),
    s(
        "script",
        fmta(
            [[
import asyncio

from scripts.common import close_pg_pool, setup_logger, setup_local_pg
from loguru import logger


async def main():
    setup_logger()
    data_context = await setup_local_pg()

    <finish>

    await close_pg_pool()


if __name__ == "__main__":
    asyncio.run(main())
            ]],
            {
                finish = i(0),
            }
        )
    ),
    s(
        "mazlo-script",
        fmta(
            [[
import asyncio

from loguru import logger

from mazlo.database.context.data_context import DataContext
from mazlo.database.interface import organization_db
from mazlo.script_base import mazlo_script


@mazlo_script
async def run_backfill(data_context: DataContext):
    orgs = await organization_db.list_organizations(data_context, list_only_valid_organizations=True)
    <finish>

asyncio.run(run_backfill())
            ]],
            {
                finish = i(0),
            }
        )
    )
})
