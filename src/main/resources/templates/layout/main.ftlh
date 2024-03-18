<#include "../layout/master.ftlh">

<@body>
    <#include "navbar.ftlh" />
    <#macro main>
        <main>
            <div class="container mx-auto px-16 mt-5 mb-5">
            <#nested>
            </div>
        </main>
    </#macro>
</@body>