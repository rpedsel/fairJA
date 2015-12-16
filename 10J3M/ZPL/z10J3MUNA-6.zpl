set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.1259, <2> 10.0879, <3> 32.3595, <4> 12.3225, <5> 19.8344, <6> 11.5543, <7> 21.512, <8> 6.8791, <9> 23.1632, <10> 27.5691;
param workload[JOB] := <1> 37.5267, <2> 101.7657, <3> 1047.1372, <4> 151.844, <5> 393.4034, <6> 133.5018, <7> 462.7661, <8> 47.322, <9> 536.5338, <10> 760.0553;
param capacity[MACHINE] := <1> 3671.856, <2> 3671.856, <3> 3671.856;

var x[JM] binary;
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
