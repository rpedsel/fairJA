set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.7463, <2> 34.559, <3> 22.2082, <4> 22.8015, <5> 5.1077, <6> 0.4983, <7> 1.4093, <8> 32.5995, <9> 14.4536, <10> 12.2189, <11> 7.9749, <12> 26.4153, <13> 3.9495, <14> 9.0837, <15> 8.5241, <16> 44.1528, <17> 14.7818, <18> 34.2995, <19> 41.8032, <20> 48.5;
param workload[JOB] := <1> 5.8092, <2> 5.8787, <3> 4.7126, <4> 4.7751, <5> 2.26, <6> 0.7059, <7> 1.1871, <8> 5.7096, <9> 3.8018, <10> 3.4956, <11> 2.824, <12> 5.1396, <13> 1.9873, <14> 3.0139, <15> 2.9196, <16> 6.6448, <17> 3.8447, <18> 5.8566, <19> 6.4655, <20> 6.9642;
param capacity[MACHINE] := <1> 83.9958, <2> 83.9958, <3> 83.9958, <4> 83.9958, <5> 83.9958, <6> 83.9958;

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
