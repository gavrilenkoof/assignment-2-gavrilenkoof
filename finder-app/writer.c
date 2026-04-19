#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/syslog.h>
#include <syslog.h>
#include <string.h>



int main(int argc, char *argv[]) {
    if (argc != 3) 
    {
        fprintf(stderr, "Usage: %s <filename> <string>\n", argv[0]);
        return EXIT_FAILURE;
    }

    openlog("writer", LOG_PID | LOG_NDELAY, LOG_USER);
    syslog(LOG_INFO, "Writer process started");

    const char *filename = argv[1];
    FILE *file = fopen(filename, "w");
    if (file == NULL) 
    {
        int err = errno;
        syslog(LOG_ERR, "Failed to open file: %s: %s", filename, strerror(err));
        closelog();
        return EXIT_FAILURE;
    }

    const char *str = argv[2];
    size_t len = strlen(str);

    size_t ret = fwrite(str, sizeof(char), len, file);
    if(ret != len)
    {
        int err = errno;
        syslog(LOG_ERR, "Failed to Write %d: %s", err, strerror(err));
        fclose(file);
        closelog();
        return EXIT_FAILURE;
    }

    fclose(file);

    syslog(LOG_INFO, "Writing %s to %s", str, filename);
    closelog();

    return EXIT_SUCCESS;
}




