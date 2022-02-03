FROM mcr.microsoft.com/dotnet/aspnet:5.0
ENV ASPNETCORE_URLS=http://+:5000
COPY /home/vsts/work/1/s/src/DevOpsChallenge.SalesApi/bin/Release/net5.0/ App/
EXPOSE 5000
EXPOSE 5001
WORKDIR /App/
ENTRYPOINT ["dotnet", "DevOpsChallenge.SalesApi.dll"]
