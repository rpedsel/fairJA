set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.8286, <2> 30.575, <3> 29.4196, <4> 29.3535, <5> 28.7403, <6> 46.0015, <7> 48.7814, <8> 48.3765, <9> 44.4658, <10> 40.2575, <11> 14.436, <12> 7.4459, <13> 15.0508, <14> 6.7232, <15> 4.1171, <16> 18.4318, <17> 43.7923, <18> 44.8335, <19> 13.4694, <20> 10.5604;
param workload[JOB] := <1> 0.9103, <2> 5.5295, <3> 5.424, <4> 5.4179, <5> 5.361, <6> 6.7824, <7> 6.9844, <8> 6.9553, <9> 6.6683, <10> 6.3449, <11> 3.7995, <12> 2.7287, <13> 3.8795, <14> 2.5929, <15> 2.0291, <16> 4.2932, <17> 6.6176, <18> 6.6958, <19> 3.6701, <20> 3.2497;
param capacity[MACHINE] := <1> 95.9341, <2> 95.9341, <3> 95.9341, <4> 95.9341, <5> 95.9341, <6> 95.9341;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
