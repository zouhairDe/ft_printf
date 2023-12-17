# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: zouddach <zouddach@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/12 16:51:15 by zouddach          #+#    #+#              #
#    Updated: 2023/11/21 10:46:02 by zouddach         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
HEADER = ft_printf.h
CC = cc
CFLAGS = -Werror -Wextra -Werror

SRC = ft_printf.c ft_printf_putchar.c ft_printf_putstr.c ft_printf_puthex.c ft_printf_putadr.c ft_printf_nbr.c ft_printf_putunsigned.c
OBJ = $(SRC:.c=.o)

GREEN = \033[0;32m
RED = \033[0;31m
DEFAULT = \033[0m
BLUE = \033[0;34m

%.o: %.c $(HEADER)
	@$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
		@echo "$(GREEN)Creating..., libftprintf.a is ready$(DEFAULT)"
		@ar rcs $(NAME) $(OBJ)
		@ranlib $(NAME)

clean:
		@echo "$(RED)Cleaning .o files...$(DEFAULT)"
		@rm -f $(OBJ)

fclean: clean
		@echo "$(BLUE)Cleaning $(NAME)...$(DEFAULT)"
		@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re