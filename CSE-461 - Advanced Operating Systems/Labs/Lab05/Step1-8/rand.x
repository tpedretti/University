/* rand.x */

program RAND_PROG {
  version RAND_VERS {
    void INITIALIZE_RANDOM ( long ) = 1;        /* service #1 */
    double GET_NEXT_RANDOM ( void ) = 2;        /* service #2 */
  } = 1;
} = 123456789;         /* program # */