/* groovylint-disable CompileStatic, DuplicateStringLiteral, NoDef, VariableName, VariableTypeRequired */
import groovy.transform.Field

@Field
def GITHUB_MAIN = 'github.com'

@Field
def GITHUB_MAIN_URL = "https://${GITHUB_MAIN}"

@Field
def GITHUB_MY_PROFILE_URL = "${GITHUB_MAIN_URL}/NAndras95"

@Field
def GITHUB_MY_DOCKER_REPO_URL = "${GITHUB_MY_PROFILE_URL}/docker"
