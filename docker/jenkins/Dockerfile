FROM jenkins/jenkins:2.452.1-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

# Install plugins
ENV PLUGINS_JENKINS_CONFIG="/usr/share/jenkins/ref/plugins.txt"
COPY --chown=jenkins:jenkins    plugins.txt    "${PLUGINS_JENKINS_CONFIG}"
RUN set -o xtrace \
    && jenkins-plugin-cli --plugins configuration-as-code:1810.v9b_c30a_249a_4c --latest false --verbose \
    && jenkins-plugin-cli --plugins -f "${PLUGINS_JENKINS_CONFIG}" --verbose

# Configuration as a code
ENV CASC_JENKINS_CONFIG="/usr/local/jenkins-casc.yaml"
COPY --chown=jenkins:jenkins    casc.yaml      "${CASC_JENKINS_CONFIG}"

ENV JENKINS_ADMIN_USERNAME='admin'          \
    JENKINS_ADMIN_PASSWORD='password'       \
    JENKINS_ADMIN_EMAIL='admin@example.com' \