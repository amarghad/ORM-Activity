<#include "../layout/main.ftlh">

<@main>
    <div class="mb-7">
        <h5 class="font-medium text-lg">Ajouter patient</h5>
        <p class="text-gray-500 text-sm">Veuillez saisir les détails de patient </p>
    </div>
    <div class="bg-white rounded-xl border px-6 py-5">
        <h3 class="font-medium text-lg mb-6">Saisir les saisir les nouveaux informations de vos dernier opération</h3>
        <div>
            <div class="grid grid-cols-2">
                <div>
                    <form action="/patients/create" method="post">
                        <div class="space-y-6">
                            <div class="grid grid-cols-2 gap-3 mb-4">
                                <div class="form-floating">
                                    <label class="block mb-2 text-sm" for="first_name">Prénom</label>
                                    <input id="first_name" type="text" class="bg-slate-50 focus:bg-white text-sm outline-none border border-slate-200 text-gray-900 rounded-md focus:ring-2 transition block w-full py-2 px-3 focus:ring-blue-500 focus:border-blue-500" name="first-name" value="" required="" autocomplete="first_name" autofocus="" placeholder="">
                                    <!-- <span class="text-red-500 text-sm">{{ $message }}</span> -->
                                </div>
                                <div class="form-floating">
                                    <label class="block mb-2 text-sm" for="last_name">Nom</label>
                                    <input id="last_name" type="text" class="bg-slate-50 focus:bg-white text-sm outline-none border border-slate-200 text-gray-900 rounded-md focus:ring-2 transition block w-full py-2 px-3 focus:ring-blue-500 focus:border-blue-500" name="last-name" value="" required="" autocomplete="last_name" autofocus="" placeholder="">
                                    <!-- <span class="text-red-500 text-sm">{{ $message }}</span> -->
                                </div>
                            </div>
                            <div>
                                <label class="block mb-2 text-sm" for="email">Adresse email</label>
                                <input id="email" type="email" class="bg-slate-50 focus:bg-white text-sm outline-none border border-slate-200 text-gray-900 rounded-md focus:ring-2 transition block w-full py-2 px-3 focus:ring-blue-500 focus:border-blue-500" name="email" value="" required="" autocomplete="email" placeholder="">
                                <!-- <span class="text-red-500 text-sm">{{ $message }}</span> -->
                            </div>
                            <div>
                                <label class="block mb-2 text-sm" for="date">Date de naissance</label>
                                <input id="date" name="date" type="date" class="mb-2 bg-slate-50 focus:bg-white outline-none border border-slate-200 text-gray-900 text-sm rounded-md focus:ring-2 transition block w-full py-2 px-3 focus:ring-blue-500 focus:border-blue-500">
                                <p class="text-gray-600 text-xs">Saisir la date de l'opération lorsqu'elle a été réalisée.</p>
                            </div>
                            <div class="grid grid-cols-2">
                                <div>
                                    <label class="block mb-2 text-sm" for="score">Score</label>
                                    <input id="score" name="score" type="number" step="1" class="mb-2 bg-slate-50 focus:bg-white outline-none border border-slate-200 text-gray-900 text-sm rounded-md focus:ring-2 transition block w-full py-2 px-3 focus:ring-blue-500 focus:border-blue-500">
                                </div>
                            </div>
                            <div>
                                <div class="flex items-center">
                                    <input name="is-sick"  id="is-sick" type="checkbox" value="" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                    <label for="is-sick" class="ms-2 text-sm font-medium text-gray-900">Le patient est malade</label>
                                </div>
                            </div>
                            <div>
                                <button class="bg-blue-600 hover:bg-blue-800 text-white font-medium py-2 rounded-md transition text-sm px-5" type="submit">Ajouter patient</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@main>