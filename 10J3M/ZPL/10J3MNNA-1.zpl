set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1988, <2> 30.8139, <3> 28.1807, <4> 28.6842, <5> 26.4772, <6> 29.3955, <7> 25.9712, <8> 34.5319, <9> 24.3934, <10> 27.4798;
param workload[JOB] := <1> 585.5819, <2> 949.4964, <3> 794.1519, <4> 822.7833, <5> 701.0421, <6> 864.0954, <7> 674.5032, <8> 1192.4521, <9> 595.038, <10> 755.1394;
param capacity[MACHINE] := <1> 7934.2837, <2> 7934.2837, <3> 7934.2837;

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
