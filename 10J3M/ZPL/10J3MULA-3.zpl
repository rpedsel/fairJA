set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5102, <2> 5.6003, <3> 17.1909, <4> 9.9329, <5> 15.4627, <6> 1.9802, <7> 5.2964, <8> 32.6162, <9> 9.0706, <10> 38.9658;
param workload[JOB] := <1> 240.5663, <2> 31.3634, <3> 295.527, <4> 98.6625, <5> 239.0951, <6> 3.9212, <7> 28.0519, <8> 1063.8165, <9> 82.2758, <10> 1518.3336;
param capacity[MACHINE] := <1> 1618.3643, <2> 1618.3643, <3> 1618.3643;

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
