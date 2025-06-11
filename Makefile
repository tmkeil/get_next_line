# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkeil <tkeil@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/26 17:14:32 by tkeil             #+#    #+#              #
#    Updated: 2025/03/26 17:14:32 by tkeil            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror
SRCSDIR = srcs/
OBJSDIR = objs/
INCLUDES = -Iheaders

GNL_SRCS = get_next_line.c get_next_line_utils.c

SRCS_GNL_PATHS = $(addprefix $(SRCSDIR), $(GNL_SRCS))

GNL_OBJS = $(addprefix $(OBJSDIR), $(GNL_SRCS:.c=.o))

NAME = libftgnl.a

all: $(NAME)

$(NAME): $(OBJS) $(GNL_OBJS)
		ar -rcs $@ $^

$(OBJSDIR)%.o: $(SRCSDIR)%.c
		mkdir -p $(OBJSDIR)
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
		rm -rf $(OBJSDIR)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
