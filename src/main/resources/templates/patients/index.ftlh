<#include "../layout/main.ftlh">

<@main>
<div class="flex items-center justify-between mb-8">
    <div>
        <h1 class="text-xl mb-1 font-bold">Patients</h1>
        <p class="text-sm text-slate-700">Consulter la listes des patients d'hôpital</p>
    </div>
    <a href="/patients/create" class="rounded-md py-2 px-4 bg-blue-600 hover:bg-blue-800 transition text-white text-sm font-bold">Ajouter patient</a>
</div>
<p class="text-sm mb-3 text-slate-500">${(currentPageNumber - 1) * elementsPerPage + 1} - ${currentPageNumber * elementsPerPage} de ${totalElements} elements</p>
<div class="bg-white rounded-xl border ">
    <div class="py-2.5 px-3.5 border-b bg-slate-50 rounded-t-xl">
        <div class="grid grid-cols-12 text-sm px-3.5 py-1.5 gap-4">
            <div class="col-span-2"><h6 class="font-bold">Nom et Prénom</h6></div>
            <div class="col-span-4"><h6 class="font-bold">Email</h6></div>
            <div class="col-span-1"><h6 class="font-bold">Score</h6></div>
            <div class="col-span-2"><h6 class="font-bold">Est malade ?</h6></div>
            <div class="col-span-2"><h6 class="font-bold">Date de naissance</h6></div>
        </div>
    </div>
    <div class="px-3.5 pt-2 pb-4">
        <#list patients as p>
        <div class="grid grid-cols-12 group text-sm items-center rounded-lg py-2 px-3.5 gap-4 transition hover:bg-slate-50">
            <div class="col-span-2"><span>${p.fullName}</span></div>
            <div class="col-span-4"><span>${p.email}</span></div>
            <div class="col-span-1"><span>${p.score}</span></div>
            <div class="col-span-2">
                <div class="flex items-center gap-2.5">
                    <span class="w-2 h-2 rounded-full ${p.sick ? string("bg-green-600", "bg-red-600")}"></span>
                    <span>${p.sick ? string("Oui", "Non")}</span>
                </div>
            </div>
            <div class="col-span-2"><span>${p.birthDate}</span></div>
            <div class="col-span-1">
                <div class="gap-2 flex items-center cursor-pointer invisible opacity-0 transition group-hover:visible group-hover:opacity-100 justify-end">
                    <a class="block py-1 px-2 hover:text-blue-600 text-slate-800 transition" href="update_oper_servlet?id=1">
                        <svg viewBox="0 0 24 24" width="18" height="18" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                    </a>
                    <form action="/patients/delete" method="post" onsubmit="return confirm('Vous être sûre de supprimer ce patient ?');">
                        <input type="hidden" name="patient" value="${p.id}">
                        <button type="submit" class="py-1 px-2 hover:text-red-600 text-slate-800 transition">
                            <svg viewBox="0 0 24 24" width="18" height="18" stroke="currentColor" stroke-width="2.25" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        </#list>
    </div>
</div>
<#if (totalPages > 1) >
<nav class="flex justify-center my-5" aria-label="Page navigation example">
    <ul class="inline-flex space-x-2 text-sm">
        <!-- Previous page button -->
        <li>
        <#if (currentPageNumber > 1) >
            <a class="flex items-center justify-center px-3.5 ms-0 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 py-2 shadow-sm font-medium"
                   href="/patients?page=${currentPageNumber - 1}&q=${searchKeyword}&size=${elementsPerPage}">Précédant</a>
        <#else>
            <span class="flex items-center justify-center px-3.5 ms-0 text-gray-700 bg-slate-200 border border-gray-300 rounded-lg py-2 shadow-sm font-medium cursor-no-drop">Précédant</span>
        </#if>
        </li>

        <#list 1..totalPages as p>
            <li>
                <#if (p == currentPageNumber)>
                    <span class="flex items-center justify-center px-3.5 ms-0 text-white bg-blue-600 border border-blue-600 rounded-lg py-2 shadow-sm font-medium">${p}</span>
                <#else>
                    <a class="flex items-center justify-center px-3.5 ms-0 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 py-2 shadow-sm font-medium"
                       href="/patients?page=${p}&q=${searchKeyword}&size=${elementsPerPage}">${p}</a>
                </#if>
            </li>
        </#list>

        <li>
        <!-- Next page button -->
        <#if (currentPageNumber < totalPages) >
            <a class="flex items-center justify-center px-3.5 ms-0 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 hover:text-gray-700 py-2 shadow-sm font-medium"
               href="/patients?page=${currentPageNumber + 1}&q=${searchKeyword}&size=${elementsPerPage}">Next</a>
        <#else>
            <span class="flex items-center justify-center px-3.5 ms-0 text-gray-700 bg-slate-200 border border-gray-300 rounded-lg py-2 shadow-sm font-medium cursor-no-drop">Suivant</span>
        </#if>
        </li>
    </ul>
</nav>
</#if>
</@main>