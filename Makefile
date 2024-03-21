NAME = libasm.a

NASM = nasm

NASM_FLAGS = -f elf64
AR_FLAGS = rcs

SRC =   src/ft_strlen.s  \
        src/ft_strcpy.s  \
        src/ft_strcmp.s  \
        src/ft_write.s   \
        src/ft_read.s    \
        src/ft_strdup.s

OBJ = $(patsubst src/%.s, obj/%.o, $(SRC))

.PHONY: all
all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(AR_FLAGS) $(NAME) $^

obj/%.o: src/%.s
	mkdir -p $(@D)
	$(NASM) $(NASM_FLAGS) $< -o $@

.PHONY: clean
clean:
	$(RM) -r ./obj

.PHONY: fclean
fclean: clean
	$(RM) $(NAME)

.PHONY: re
re: fclean all
