#define LUA_LIB
#include "lua.h"
#include "lauxlib.h"

#include <stdio.h>

static int hello(lua_State *L) {
	fprintf(stdout, "Hello\n");
	return 1;
}

static const luaL_Reg hellolib[] = {
	{"hello", hello},
	{NULL, NULL}
};

LUALIB_API int luaopen_libhello(lua_State *L) {
	luaL_register(L, "hello", hellolib);
	return 1;
}

