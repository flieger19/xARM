"""
Documentation, License etc.

@package X-ARM Xcode template for embedded arm cortex-m development
"""

import shutil
import os
import sys


ROOT_DIR = os.path.dirname(os.path.abspath(__file__))


def install_files(destination, files):
    """
    Install files in a given directory
    :param destination: Directory to install files to
    :param files: Files to install in a given directory
    """
    if not os.path.isdir(destination):
        try:
            os.makedirs(destination)
        except OSError:
            print("Creation of the directory %s failed" % destination)

    for file_name in files:
        try:
            shutil.copy(file_name, destination)
        except IOError as error:
            print("Unable to copy file. %s" % error)
        except:
            print("Unexpected error:", sys.exc_info())


def install_templates(templates):
    """
    Installs the Xcode templates in the Xcode template user dir
    :param templates: List of templates to install
    """
    destination_directory = os.path.expanduser('~') + "/Library/Developer/Xcode/Templates/Project Templates/X-ARM/"
    templates_directory = ROOT_DIR + "/Templates/"
    resource_directory = ROOT_DIR + "/Resources/"
    icons = [resource_directory + "TemplateIcon.png", resource_directory + "TemplateIcon@2x.png"]

    for template in templates:
        files = []
        for file in os.listdir(templates_directory + template):
            files += [templates_directory + template + "/" + file]
        install_files(destination_directory + template + ".xctemplate", files)
        install_files(destination_directory + template + ".xctemplate", icons)


def directory_iterator(source, target):
    """
    Iterates through a directory and symlinks all containing files in a target director with the same structure
    :param source: Directory to iterate through
    :param target: Directory to symlink files to
    """
    for file in os.listdir(source):
        filename = os.fsdecode(file)
        path_source = source + "/" + file
        path_target = target + "/" + file
        if os.path.isdir(path_source):
            try:
                os.makedirs(os.fsdecode(path_target))
            except OSError:
                print("Creation of the directory %s failed" % os.fsdecode(path_target))
            directory_iterator(os.fsdecode(path_source), os.fsdecode(path_target))
        elif os.path.isfile(path_source):
            print(path_source, path_target)
            try:
                os.symlink(path_source, path_target)
            except:
                print("Symlink Error")
        elif os.access(path_source, os.X_OK):
            try:
                os.symlink(path_source, path_target)
            except:
                print("Symlink Error")
        elif os.path.islink(path_source):
            continue
        else:
            print("Special file ", path_source)


def install_sdk_files(destination_directory):
    """
    Installs the header, library, etc. files to the SDK
    :param destination_directory: Destination directory for the files
    """
    source_directory = "/usr/local/Cellar/armv7em-cortex-m4f/10.0.0/armv7em-none-eabi/cortex-m4f/"
    include_directory = "include/"
    library_directory = "lib/"
    destination_directory = destination_directory + "/usr/"
    library_compiler_rt = "libclang_rt.builtins-"

    try:
        os.makedirs(destination_directory + include_directory)
    except OSError:
        print("Creation of the directory %s failed" % destination_directory + include_directory)
    try:
        os.makedirs(destination_directory + library_directory)
    except OSError:
        print("Creation of the directory %s failed" % destination_directory + library_directory)
    directory_iterator(source_directory + include_directory, destination_directory + include_directory)
    directory_iterator(source_directory + library_directory, destination_directory + library_directory)

    for file in os.listdir(destination_directory + library_directory):
        if library_compiler_rt in file:
            try:
                os.symlink(destination_directory + library_directory + file, destination_directory + library_directory + file + ".a")
            except:
                print("Symlink Error")


def install_sdk(source_directory, destination_directory):
    """
    Installs Xcode SDK inside its corresponding platform in the Xcode platform user dir
    :param source_directory: Source directory of the SDK
    :param destination_directory: Destination directory of the SDK
    """
    source_directory = source_directory + "/sdk/"
    destination_directory_version = destination_directory + "/Developer/SDKs/Cortex-M4F10.0.0.sdk"
    destination_directory = destination_directory + "/Developer/SDKs/Cortex-M4F.sdk"

    files = []
    for file in os.listdir(source_directory):
        files += [source_directory + "/" + file]
    install_files(destination_directory, files)
    install_sdk_files(destination_directory)
    try:
        os.symlink(destination_directory, destination_directory_version)
    except:
        print("Symlink Error")


def install_platform(platforms):
    """
    Installs Xcode platform in the Xcode platform user dir
    :param platforms: List of platforms to install
    """
    destination_directory = os.path.expanduser('~') + "/Library/Developer/Platforms"
    platforms_directory = ROOT_DIR + "/Platforms/"
    resource_directory = ROOT_DIR + "/Resources/"
    icons = [resource_directory + "Icon.icns"]

    for platform in platforms:
        files = []
        for file in os.listdir(platforms_directory + platform + "/platform"):
            files += [platforms_directory + platform + "/platform/" + file]
        install_files(destination_directory + "/" + platform + ".platform", files)
        install_files(destination_directory + "/" + platform + ".platform", icons)
        install_sdk(platforms_directory + platform, destination_directory + "/" + platform + ".platform")


def install():
    """
    Install package files
    """
    templates = ["STM32CubeMX"]

    install_templates(templates)

    platforms = ["Cortex-M4F"]

    install_platform(platforms)


if __name__ == "__main__":
    install()
