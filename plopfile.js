const promptDirectory = require('inquirer-directory');

module.exports = function (plop) {
    plop.setPrompt('directory', promptDirectory);

    const basePath = process.cwd();

    const path = {
        type: 'directory',
        name: 'directory',
        message: 'Choose a directory..',
        basePath: basePath
    };

    plop.setGenerator('store', {
        description: 'ngrx store generator',
        prompts: [
            path,
        ],
        actions: function (data) {
            const {directory} = data;
            data.targetFolder = getTargetFolder(directory);
            const module = createActions(directory, ['module', 'routing']);
            const mainComponent = createMainComponentActions(directory, ['html', 'scss', 'spec.ts', 'ts']);
            const store = createActions(directory, ['actions', 'effects', 'reducer', 'selector'], 'store');
            const CONST = createActions(directory, ['const'], 'consts');
            const model = createActions(directory, ['interface'], 'models');
            return [...module, ...mainComponent, ...store, ...CONST, ...model]
        }

    });

    function createActions(selectedDirectory, ngBuildingBlockNames, subDirectory = '') {
        if (subDirectory) {
            subDirectory += '/';
        }
        const actions = [];
        ngBuildingBlockNames.forEach((ngBuildingBlockName) => {
            actions.push(
                {
                    type: 'add',
                    skipIfExists: true,
                    path: getPath(selectedDirectory, ngBuildingBlockName, 'ts', subDirectory),
                    templateFile: `plop-templates/${subDirectory}${ngBuildingBlockName}.tpl`,
                    abortOnFail: true
                }
            )
        });
        return actions;
    }

    function createMainComponentActions(selectedDirectory, fileTypes) {
        const actions = [];
        const targetFolder = getTargetFolder(selectedDirectory);
        fileTypes.forEach((fileType) => {
            actions.push(
                {
                    type: 'add',
                    skipIfExists: true,
                    path: getPath(selectedDirectory, 'component', fileType, `main-${targetFolder}/`),
                    templateFile: `plop-templates/main-component/main.component.${fileType}.tpl`,
                    abortOnFail: true
                }
            )
        });
        return actions;
    }

    function getPath(selectedDirectory, ngBuildingBlockName, fileType = 'ts', subDirectory = '') {
        const targetFolder = getTargetFolder(selectedDirectory);
        return `${process.cwd()}/${selectedDirectory}/${subDirectory}${targetFolder}.${ngBuildingBlockName}.${fileType}`;
    }

    function getTargetFolder(selectedDirectory) {
        return selectedDirectory.split('/').pop();
    }
};