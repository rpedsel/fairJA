set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4428, <2> 18.4421, <3> 23.1003, <4> 27.448, <5> 31.4761, <6> 30.5673, <7> 26.0679, <8> 33.2158, <9> 24.3965, <10> 20.942;
param workload[JOB] := <1> 503.6793, <2> 340.1111, <3> 533.6239, <4> 753.3927, <5> 990.7449, <6> 934.3598, <7> 679.5354, <8> 1103.2894, <9> 595.1892, <10> 438.5674;
param capacity[MACHINE] := <1> 2290.831, <2> 2290.831, <3> 2290.831;

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
