<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="h-full bg-white">
    <head>
        <title>Admin - agent management</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <script defer src="https://unpkg.com/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
    </head>
    <body class="h-full">
        <div class="min-h-full">
            <div class="bg-cyan-600 pb-32">
                <nav class="bg-cyan-500 border-b border-cyan-100 border-opacity-25 lg:border-none">
                    <div class="max-w-7xl mx-auto px-2 sm:px-4 lg:px-8">
                        <div class="relative h-16 flex items-center justify-between lg:border-b lg:border-indigo-400 lg:border-opacity-25">
                            <div class="px-2 flex items-center lg:px-0">
                                <div class="flex-shrink-0">
                                    <img class="block h-8 w-8" src="https://tailwindui.com/img/logos/workflow-mark-indigo-300.svg" alt="Workflow">
                                </div>
                                <div class="hidden lg:block lg:ml-10">
                                    <div class="flex space-x-4">
                                        <!-- Current: "bg-indigo-700 text-white", Default: "text-white hover:bg-indigo-500 hover:bg-opacity-75" -->
                                        <a href="#" class="bg-cyan-800 text-white rounded-md py-2 px-3 text-sm font-medium" aria-current="page"> Dashboard </a>

                                    </div>
                                </div>
                            </div>

                            <div class="flex lg:hidden">
                                <!-- Mobile menu button -->
                                <button type="button" class="bg-indigo-600 p-2 rounded-md inline-flex items-center justify-center text-indigo-200 hover:text-white hover:bg-indigo-500 hover:bg-opacity-75 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-indigo-600 focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                                    <span class="sr-only">Open main menu</span>
                                    <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                                    </svg>
                                    <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                </button>
                            </div>

                            <div class="hidden lg:block lg:ml-4" x-data="{logout: false}">
                                <div class="flex items-center">

                                    <!-- Profile dropdown -->
                                    <div class="ml-3 relative flex-shrink-0">
                                        <div>
                                            <button x-on:click="logout = true" type="button" class="bg-indigo-600 rounded-full flex text-sm text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-indigo-600 focus:ring-white" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                                <span class="sr-only">Open user menu</span>
                                                <img class="rounded-full h-8 w-8" src="https://imgs.search.brave.com/OqJDhONxNqUvXxAxVFvdGWGylFfojMZNMw0u012ciZs/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5f/Vm9UZlV6RU5sZEVt/RGJGRWNRaTRRSGFI/YSZwaWQ9QXBp" alt="">
                                            </button>
                                        </div>

                                        <div x-show="logout" @click.outside="logout = false" class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                                            <!-- Active: "bg-gray-100", Not Active: "" -->
                                            <a href="#" class="block py-2 px-4 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0"> Logout </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Mobile menu, show/hide based on menu state. -->
                    <div class="lg:hidden" id="mobile-menu">
                        <div class="px-2 pt-2 pb-3 space-y-1">
                            <!-- Current: "bg-indigo-700 text-white", Default: "text-white hover:bg-indigo-500 hover:bg-opacity-75" -->
                            <a href="#" class="bg-indigo-700 text-white block rounded-md py-2 px-3 text-base font-medium" aria-current="page"> Dashboard </a>

                        </div>
                        <div class="pt-4 pb-3 border-t border-indigo-700">
                            <div class="px-5 flex items-center">
                                <div class="flex-shrink-0">
                                    <img class="rounded-full h-10 w-10" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                                </div>
                                <div class="ml-3">
                                    <div class="text-base font-medium text-white">Tom Cook</div>
                                    <div class="text-sm font-medium text-indigo-300">tom@example.com</div>
                                </div>
                                <button type="button" class="ml-auto bg-indigo-600 flex-shrink-0 rounded-full p-1 text-indigo-200 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-indigo-600 focus:ring-white">
                                    <span class="sr-only">View notifications</span>
                                    <!-- Heroicon name: outline/bell -->
                                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                                    </svg>
                                </button>
                            </div>
                            <div class="mt-3 px-2 space-y-1">
                                <a href="#" class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-indigo-500 hover:bg-opacity-75"> Sign out </a>
                            </div>
                        </div>
                    </div>
                </nav>
                <header class="py-10">
                    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex justify-between">
                        <h1 class="font-bold text-white">
                            <img class="h-16 w-20" src="https://imgs.search.brave.com/HtbJt6kxB1qcEzxTPBikAh7Y05ioSmMpGMvnMElbtJk/rs:fit:748:512:1/g:ce/aHR0cHM6Ly9yYWRp/b3RldG91YW4ubWEv/d3AtY29udGVudC91/cGxvYWRzLzIwMTkv/MDcvY25zcy5sb2dv/Xy5qcGc">
                        </h1>
                    </div>
                </header>
            </div>

            <main class="-mt-32" x-data="{displayForm: false}">
                <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
                    <div class="flex justify-end">
                        <button x-on:click="displayForm = true" class="mb-4 bg-cyan-700 text-white border border-cyan-800 block rounded-md py-2 px-3 text-base font-medium" >
                            Add new dossier
                        </button>
                    </div>

                    <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">

                        <div class="overflow-hidden overflow-x-auto rounded-lg border border-gray-200" x-show="!displayForm">
                            <table class="min-w-full divide-y divide-gray-200 text-sm">
                                <thead class="bg-gray-100">
                                <tr>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900">
                                        <div class="flex items-center gap-2">
                                            Dossier number
                                        </div>
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900" >
                                        <div class="flex items-center gap-2">
                                            Patient Number
                                        </div>
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900" >
                                        <div class="flex items-center gap-2">
                                            Applied date
                                        </div>
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900" >
                                        <div class="flex items-center gap-2">
                                            Amount
                                        </div>
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900" >
                                        Status
                                    </th>
                                    <th class="whitespace-nowrap px-4 py-2 text-left font-medium text-gray-900" >
                                        <div class="flex items-center gap-2">
                                            Action
                                        </div>
                                    </th>
                                </tr>
                                </thead>

                                <tbody class="divide-y divide-gray-200">
                                <c:forEach var="dos" items="${dossiers}" >
                                    <tr>
                                        <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                            ${dos.number}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            ${dos.patientNumber}
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            <fmt:formatDate value="${dos.appliedDate}" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700 ">
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${dos.amount}"/> DH
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                            <c:if test="${ dos.status == 'PENDING'}" >
                                                <strong class="rounded bg-amber-100 px-3 py-1.5 text-xs font-medium text-amber-700" >
                                                    Pending
                                                </strong>
                                            </c:if>
                                            <c:if test="${ dos.status == 'REJECTED'}" >
                                                <strong class="rounded bg-red-100 px-3 py-1.5 text-xs font-medium text-red-700">
                                                    Rejected
                                                </strong>
                                            </c:if>
                                            <c:if test="${ dos.status == 'ACCEPTED'}" >
                                                <strong class="rounded bg-green-100 px-3 py-1.5 text-xs font-medium text-green-700" >
                                                    Accepted
                                                </strong>
                                            </c:if>
                                        </td>
                                        <td class="whitespace-nowrap px-4 py-2 text-gray-700 flex">
                                            <c:if test="${dos.status == 'PENDING'}" >
                                                <a href="/agent/reject/${dos.id}">
                                                    <svg class="w-7 h-7 text-red-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                                                </a>
                                                <a href="/agent/accept/${dos.id}">
                                                    <svg class="w-7 h-7 text-green-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <%-- form add dossier --%>
                        <div class="rounded-lg bg-white p-8 shadow-lg lg:col-span-3 lg:p-12" x-data="{step: 1}" x-show="displayForm">

                            <ul class="flex border-b border-gray-100">
                                <li class="flex-1">
                                    <a class="relative block p-4" href="">
                                      <span x-show="step == 1" class="absolute inset-x-0 -bottom-px h-px w-full bg-pink-600" ></span>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 13V5a2 2 0 00-2-2H4a2 2 0 00-2 2v8a2 2 0 002 2h3l3 3 3-3h3a2 2 0 002-2zM5 7a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm1 3a1 1 0 100 2h3a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                            <span class="ml-3 text-sm font-medium text-gray-900"> Consultation </span>
                                        </div>
                                    </a>
                                </li>

                                <li class="flex-1">
                                    <div class="relative block p-4">
                                        <span x-show="step == 2" class="absolute inset-x-0 -bottom-px h-px w-full bg-pink-600" ></span>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7 2a1 1 0 00-.707 1.707L7 4.414v3.758a1 1 0 01-.293.707l-4 4C.817 14.769 2.156 18 4.828 18h10.343c2.673 0 4.012-3.231 2.122-5.121l-4-4A1 1 0 0113 8.172V4.414l.707-.707A1 1 0 0013 2H7zm2 6.172V4h2v4.172a3 3 0 00.879 2.12l1.027 1.028a4 4 0 00-2.171.102l-.47.156a4 4 0 01-2.53 0l-.563-.187a1.993 1.993 0 00-.114-.035l1.063-1.063A3 3 0 009 8.172z" clip-rule="evenodd"></path></svg>
                                            <span class="ml-3 text-sm font-medium text-gray-900"> Medications </span>
                                        </div>
                                    </div>
                                </li>

                                <li class="flex-1">
                                    <div class="relative block p-4">
                                        <span x-show="step == 3" class="absolute inset-x-0 -bottom-px h-px w-full bg-pink-600" ></span>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9 2a2 2 0 00-2 2v8a2 2 0 002 2h6a2 2 0 002-2V6.414A2 2 0 0016.414 5L14 2.586A2 2 0 0012.586 2H9z"></path><path d="M3 8a2 2 0 012-2v10h8a2 2 0 01-2 2H5a2 2 0 01-2-2V8z"></path></svg>
                                            <span class="ml-3 text-sm font-medium text-gray-900"> Documents </span>
                                        </div>
                                    </div>
                                </li>

                                <li class="flex-1">
                                    <div class="relative block p-4">
                                        <span x-show="step == 4" class="absolute inset-x-0 -bottom-px h-px w-full bg-pink-600" ></span>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                                            <span class="ml-3 text-sm font-medium text-gray-900">
                                              Validation
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <form action="/agent/add" class="space-y-4" method="post" x-data="{patientNumber: '', consulType: '', countMeds: 1, countDocs: 1}">

                                <%-- step 1 --%>
                                <div class="mt-5 flex flex-col items-center" x-show=" step == 1">
                                    <div class="my-2 w-1/2">
                                        <label class="sr-only" for="patient">Patient Number</label>
                                        <input x-model="patientNumber" required name="patient" type="number" placeholder="Patient Number" id="patient" class="w-full rounded-lg border border-gray-600 p-3 text-sm"  />
                                    </div>

                                    <div class="w-1/2">
                                        <fieldset class="flex flex-wrap gap-3 justify-between" x-init="$watch('consulType', value => console.log(value))">
                                            <h1 class="text-lg font-bold">Consultation</h1>
                                            <div>
                                                <input x-model="consulType" type="radio" name="consultation" value="120" id="generalist" class="peer hidden" />
                                                <label
                                                        for="generalist"
                                                        class="flex cursor-pointer items-center justify-center rounded-md border border-gray-600 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white"
                                                >
                                                    <p class="text-sm font-medium">Generalist</p>
                                                </label>
                                            </div>
                                            <div>
                                                <input x-model="consulType" type="radio" name="consultation" value="160" id="specialist" class="peer hidden" checked />
                                                <label
                                                        for="specialist"
                                                        class="flex cursor-pointer items-center justify-center rounded-md border border-gray-600 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white"
                                                >
                                                    <p class="text-sm font-medium">Specialist</p>
                                                </label>
                                            </div>

                                        </fieldset>
                                    </div>
                                </div>

                                <%-- step 2 --%>
                                <div class="mt-5 flex flex-col items-center" x-show=" step == 2">
                                    <div class="my-2 w-1/2">
                                        <template x-for="i in countMeds">
                                            <input :name="'medic'+i" type="number" :placeholder="'Medicament Number '+i" class="my-1 w-full rounded-lg border border-gray-600 p-3 text-sm"  />
                                        </template>
                                    </div>
                                    <div class="w-1/2 flex justify-end">
                                        <button type="button" x-on:click="countMeds++" >
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path></svg>
                                        </button>
                                    </div>
                                    <input type="text" :value="countMeds" name="medic_number" hidden>
                                </div>

                                <%-- step 3 --%>
                                <div class="mt-5 flex flex-col items-center" x-show=" step == 3" >
                                    <div class="my-2 w-1/2">
                                        <template x-for="i in countDocs">
                                            <div>
                                                <span class="" x-text="'Document number '+i+': '" ></span>
                                                <div class="flex justify-evenly items-center">
                                                    <select class="mr-1 my-1 w-full rounded-lg border border-gray-600 p-3 text-sm" :name="'docType'+i">
                                                        <option value="RADIO">Radio document</option>
                                                        <option value="SCANNER">Scanner document</option>
                                                        <option value="ANALYSE">Analyse document</option>
                                                    </select>
                                                    <input :name="'docPrice'+i" type="text" :placeholder="'Document price Number '+i" class="ml-1 my-1 w-full rounded-lg border border-gray-600 p-3 text-sm"  />
                                                </div>
                                            </div>
                                        </template>
                                    </div>
                                    <div class="w-1/2 flex justify-end">
                                        <button type="button" x-on:click="countDocs++" >
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd"></path></svg>
                                        </button>
                                    </div>
                                    <input type="text" :value="countDocs" name="docs_number" hidden>
                                </div>

                                <%-- step 4 --%>
                                <article class="rounded-xl border-2 border-gray-100 bg-white" x-show=" step == 4">
                                    <div class="flex justify-center p-6">
                                        <div class="ml-4 flex flex-col">
                                            <h3 class="font-medium sm:text-lg">
                                                <a href="#" class="hover:underline">
                                                    Patient Number <span x-text="patientNumber" ></span>
                                                </a>
                                            </h3>

                                            <p class="text-md text-gray-700 line-clamp-2">
                                                Consultation Type : <span x-text="consulType == 120 ? 'Generalist' : 'Specialist'" class="font-bold"></span>
                                            </p>

                                            <p class="text-md text-gray-700 line-clamp-2">
                                                Number of Medication : <span x-text="countMeds" class="font-bold"></span>
                                            </p>

                                            <p class="text-md text-gray-700 line-clamp-2">
                                                Number of Documents : <span x-text="countDocs" class="font-bold"></span>
                                            </p>

                                        </div>
                                    </div>
                                </article>

                                <div :class=" step == 1 ? 'mt-4 flex justify-end' : 'mt-4 flex justify-between'">
                                    <button x-show="step != 1" type="button" x-on:click="step--" class="inline-flex w-full items-center justify-center rounded-lg bg-gray-400 px-5 py-3 text-white sm:w-auto">
                                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
                                        <span class="font-medium"> Previous </span>
                                    </button>
                                    <div class="flex justify-end">
                                        <button x-show="step != 4" type="button" x-on:click="step++" class="mr-2 inline-flex w-full items-center justify-center rounded-lg bg-black px-5 py-3 text-white sm:w-auto">
                                            <span class="font-medium"> Next </span>
                                            <svg xmlns="http://www.w3.org/2000/svg" class="ml-3 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                                            </svg>
                                        </button>
                                        <button type="submit" class="inline-flex w-full items-center justify-center rounded-lg bg-green-500 px-5 py-3 text-white sm:w-auto">
                                            <span class="font-medium"> Submit </span>
                                            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
                                        </button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                    <!-- /End replace -->
                </div>
            </main>
        </div>
    </body>
</html>