<%--
  Created by IntelliJ IDEA.
  User: ssaad_chaay
  Date: 12/2/2022
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- component -->
        <div class="flex items-center justify-center h-screen">
            <!-- Login Container -->
            <form:form action="/login" modelAttribute="person" method="post">
                <div class="min-w-fit flex-col border bg-white px-6 py-14 shadow-md rounded-[4px] ">
                    <div class="mb-8 flex justify-center">
                        <img class="w-24" src="https://imgs.search.brave.com/HtbJt6kxB1qcEzxTPBikAh7Y05ioSmMpGMvnMElbtJk/rs:fit:748:512:1/g:ce/aHR0cHM6Ly9yYWRp/b3RldG91YW4ubWEv/d3AtY29udGVudC91/cGxvYWRzLzIwMTkv/MDcvY25zcy5sb2dv/Xy5qcGc" alt="" />
                    </div>
                    <div class="my-4 flex justify-center">
                        <c:if test="${not empty error}"><div>${error}</div></c:if>
                    </div>
                    <div class="flex flex-col text-sm rounded-md">
                        <form:input path="email" class="mb-5 rounded-[4px] border p-3 hover:outline-none focus:outline-none hover:border-yellow-500 " type="email" placeholder="Email Address" />
                        <form:input path="password" class="border rounded-[4px] p-3 hover:outline-none focus:outline-none hover:border-yellow-500" type="password" placeholder="Password" />
                    </div>
                    <fieldset class="flex flex-wrap gap-3 justify-between mt-5">
                        <legend class="sr-only">Role</legend>

                        <div>
                            <form:radiobutton path="role"  value="AGENT" id="agent" class="peer hidden" />
                            <label
                                    for="agent"
                                    class="flex cursor-pointer items-center justify-center rounded-md border border-gray-100 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white"
                            >
                                <p class="text-sm font-medium">Agent</p>
                            </label>
                        </div>

                        <div>
                            <form:radiobutton path="role"  value="PATIENT" id="patient" class="peer hidden" />

                            <label
                                    for="patient"
                                    class="flex cursor-pointer items-center justify-center rounded-md border border-gray-100 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white"
                            >
                                <p class="text-sm font-medium">Patient</p>
                            </label>
                        </div>
                        <div>
                            <form:radiobutton path="role"  value="ADMIN" id="admin" class="peer hidden" />

                            <label
                                    for="admin"
                                    class="flex cursor-pointer items-center justify-center rounded-md border border-gray-100 py-2 px-3 text-gray-900 hover:border-gray-200 peer-checked:border-blue-500 peer-checked:bg-blue-500 peer-checked:text-white"
                            >
                                <p class="text-sm font-medium">Admin</p>
                            </label>
                        </div>
                    </fieldset>

                    <button class="mt-5 w-full border p-2 bg-gradient-to-r from-cyan-900 bg-cyan-500 text-white rounded-[4px] hover:bg-cyan-800 scale-105 duration-300" type="submit">Login</button>
                    <div class="mt-5 flex text-center text-sm text-gray-400">
                        <p>
                            This site is protected by reCAPTCHA and the Google <br />
                            <a class="underline" href="">Privacy Policy</a>  and <a class="underline" href="">Terms of Service</a>  apply.
                        </p>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>
