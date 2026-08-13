(*
    Objetivo:
    Representar em ROCQ a definição recursiva da soma baseada nos axiomas de Peano.

    Definição:
        m + 0   = m
        m + S(n) = S(m + n)

    Construção dos números naturais:

        0 = Zero
        1 = S Zero
        2 = S (S Zero)
        3 = S (S (S Zero))
        ...

    Onde S:N -> N representa a função sucessor:
        S(n) = n + 1
*)


Fixpoint soma (m n : nat) : nat :=
    match n with
    |0    => m
    |S n' => S(soma m n')
    end.


Compute soma 3 7.


(*Usando Lemma para definir os axiomas de Peano que usarei para provar a associatividade da adição*)

Lemma soma_m_0 : forall m : nat, soma m 0 = m.
Proof.
    simpl.
    reflexivity.
Qed.


Lemma soma_S : forall m n : nat, soma m (S n) = S(soma m n).
Proof.
    simpl.
    reflexivity.
Qed.


Theorem soma_assoc : forall m n p : nat, soma m (soma n p) = soma(soma m n) p.
Proof.
    intros m n p. induction p as [| p' IHp'].
    - simpl. reflexivity.
    - simpl. rewrite IHp'. reflexivity.
Qed.