SHELL              := $(shell which bash)

NO_COLOR           := \033[0m
OK_COLOR           := \033[32;01m
ERR_COLOR          := \033[31;01m
WARN_COLOR         := \033[36;01m
ATTN_COLOR         := \033[33;01m

OS                 := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH               := $(shell uname -m | tr '[:upper:]' '[:lower:]')

EXT_DIR            := ./.ext
EXT_BIN_DIR        := ${EXT_DIR}/bin
EXT_TMP_DIR        := ${EXT_DIR}/tmp

SVU_VER 	         := 2.2.0
BUF_VER            := 1.50.0

PROJECT            := access

GIT_ORG            := "github.com/authzen"
GIT_REPO           := "${GIT_ORG}/${PROJECT}"

BUF_ORG            := "buf.build/authzen"
BUF_REPO           := "${BUF_ORG}/${PROJECT}"
BUF_LATEST         := $(shell ${EXT_BIN_DIR}/buf registry module label list ${BUF_REPO} --format json --reverse | jq -r '.labels[0].name')
BUF_BIN_DIR        := ./bin
BUF_BIN_IMAGE      := "${PROJECT}.bin"

RELEASE_TAG        := $$(${EXT_BIN_DIR}/svu)

.DEFAULT_GOAL      := buf-build

.PHONY: buf-login
buf-login:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf registry login --username ${USER}

.PHONY: buf-build
buf-build: ${BUF_BIN_DIR} buf.lock
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf build --output ${BUF_BIN_DIR}/${BUF_BIN_IMAGE}

buf.lock:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf dep update

.PHONY: buf-lint
buf-lint:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf lint

.PHONY: buf-breaking
buf-breaking: 
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf breaking --against "https://${GIT_REPO}.git#branch=main"

.PHONY: buf-push
buf-push:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf push --label ${RELEASE_TAG}

info: 
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo "PROJECT:       ${PROJECT}"
	@echo ""
	@echo "GIT_REPO:      ${GIT_REPO}"
	@echo "RELEASE_TAG:   ${RELEASE_TAG}"
	@echo ""
	@echo "BUF_REPO:      ${BUF_REPO}"
	@echo "BUF_LATEST:    ${BUF_LATEST}"
	@echo "BUF_BIN_DIR:   ${BUF_BIN_DIR}"
	@echo "BUF_BIN_IMAGE: ${BUF_BIN_IMAGE}"
	@echo ""
	@echo "OS-ARCH:       ${OS}-${ARCH}"
	@echo "EXT_DIR:       ${EXT_DIR}"
	@echo "EXT_BIN_DIR:   ${EXT_BIN_DIR}"
	@echo "EXT_TMP_DIR:   ${EXT_TMP_DIR}"
	
deps: ${EXT_BIN_DIR}/buf ${EXT_BIN_DIR}/svu info
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh --version >/dev/null 2>&1 || { echo >&2 "required dependency 'gh' is not installed.  Aborting."; exit 1; }
	@jq --version >/dev/null 2>&1 || { echo >&2 "required dependency 'jq' is not installed.  Aborting."; exit 1; }

${EXT_BIN_DIR}/buf: ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download v${BUF_VER} --repo https://github.com/bufbuild/buf --pattern "buf-$$(uname -s)-$$(uname -m)" --output "${EXT_BIN_DIR}/buf" --clobber
	@chmod +x ${EXT_BIN_DIR}/buf
	@${EXT_BIN_DIR}/buf --version

${EXT_BIN_DIR}/svu: install-svu-${OS}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@chmod +x ${EXT_BIN_DIR}/svu
	@${EXT_BIN_DIR}/svu --version

install-svu-darwin: ${EXT_TMP_DIR} ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download v${SVU_VER} --repo https://github.com/caarlos0/svu --pattern "svu_${SVU_VER}_${OS}_all.tar.gz" --output "${EXT_TMP_DIR}/svu.tar.gz" --clobber
	@tar -xvf ${EXT_TMP_DIR}/svu.tar.gz --directory ${EXT_BIN_DIR} svu &> /dev/null

install-svu-linux: ${EXT_TMP_DIR} ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download  v${SVU_VER} --repo https://github.com/caarlos0/svu --pattern "svu_${SVU_VER}_${OS}_${ARCH}.tar.gz" --output "${EXT_TMP_DIR}/svu.tar.gz" --clobber
	@tar -xvf ${EXT_TMP_DIR}/svu.tar.gz --directory ${EXT_BIN_DIR} svu &> /dev/null

.PHONY: clean
clean:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@rm -rf ./.ext
	@rm -rf ./bin

.PHONY: clean-gen
clean-gen:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@rm -rf ./api

${BUF_BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${BUF_BIN_DIR}

${EXT_BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_BIN_DIR}

${EXT_TMP_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_TMP_DIR}
