PACKAGES_FILE = 'packages.txt'
CURRENT_JETBRAINS_VERSION = "2018.2.4"

IDEA_LINK = "https://download.jetbrains.com/idea/ideaIU-{}.tar.gz"
CLION_LINK = "https://download.jetbrains.com/cpp/CLion-{}.tar.gz"
PYCHARM_LINK = "https://download.jetbrains.com/python/pycharm-professional-{}.tar.gz"
DATAGRIP_LINK = "https://download.jetbrains.com/datagrip/datagrip-{}.tar.gz"


def install_jetbrains_products():
    pass


def install_operating_system_packages():
    with open(PACKAGES_FILE) as packages_file:
        packages = [line.strip() for line in packages_file.readlines()]
    command = 'sudo zypper in' + ' ' + ' '.join(packages)
    print(command)


def main():
    install_operating_system_packages()


if __name__ == '__main__':
    main()