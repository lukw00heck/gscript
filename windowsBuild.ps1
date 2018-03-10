$myCwd = (Get-Item -Path ".\" -Verbose).FullName
go-bindata -pkg main -nomemcopy -o $env:GOPATH\src\github.com\gen0cide\gscript\generator\bindata.go -prefix 'generator' generator\templates\...
go run generator\main.go generator\bindata.go generate --config $env:GOPATH\src\github.com\gen0cide\gscript\functions.yml --out $env:GOPATH\src\github.com\gen0cide\gscript\engine\vm_functions.go --docs $env:GOPATH\src\github.com\gen0cide\gscript\FUNCTIONS.md
cd $env:GOPATH\src\github.com\gen0cide\gscript\cmd\gscript
go-bindata -pkg compiler -nomemcopy -o $env:GOPATH\src\github.com\gen0cide\gscript\compiler\bindata.go -prefix '..\..' ..\..\templates\...
go build -o $env:GOPATH\bin\gscript
cd $myCwd