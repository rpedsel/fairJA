set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.4366, <2> 25.7849, <3> 22.7882, <4> 29.2078, <5> 31.0671, <6> 17.8504, <7> 24.626, <8> 29.153, <9> 20.2717, <10> 25.9838, <11> 25.9605, <12> 25.7164, <13> 30.0629, <14> 23.0076, <15> 24.2522, <16> 10.3749, <17> 22.6756, <18> 24.8221, <19> 16.6464, <20> 19.2719;
param workload[JOB] := <1> 5.6068, <2> 5.0779, <3> 4.7737, <4> 5.4044, <5> 5.5738, <6> 4.225, <7> 4.9625, <8> 5.3994, <9> 4.5024, <10> 5.0974, <11> 5.0951, <12> 5.0711, <13> 5.483, <14> 4.7966, <15> 4.9247, <16> 3.221, <17> 4.7619, <18> 4.9822, <19> 4.08, <20> 4.39;
param capacity[MACHINE] := <1> 97.4289, <2> 97.4289, <3> 97.4289, <4> 97.4289, <5> 97.4289, <6> 97.4289, <7> 97.4289;

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
