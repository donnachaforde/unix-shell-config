#--------------------------------------------------------------------------
#
# .login - executed after .cshrc by login shell 
#
#--------------------------------------------------------------------------


echo "Loading ~/.login"
echo ""


if ( -f /usr/local/COMMON/.login ) then
	source /usr/local/COMMON/.login
endif

