
<%
    from pwnlib.shellcraft.powerpc.linux import syscall
%>
<%page args="addr, len"/>
<%docstring>
Invokes the syscall munlock.  See 'man 2 munlock' for more information.

Arguments:
    addr(void): addr
    len(size_t): len
</%docstring>

    ${syscall('SYS_munlock', addr, len)}
