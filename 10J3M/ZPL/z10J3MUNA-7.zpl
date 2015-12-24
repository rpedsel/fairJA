set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8393, <2> 10.1995, <3> 3.0566, <4> 44.5779, <5> 0.9525, <6> 25.4151, <7> 30.3998, <8> 39.599, <9> 26.7934, <10> 3.2801;
param workload[JOB] := <1> 434.2764, <2> 104.0298, <3> 9.3428, <4> 1987.1892, <5> 0.9073, <6> 645.9273, <7> 924.1478, <8> 1568.0808, <9> 717.8863, <10> 10.7591;
param capacity[MACHINE] := <1> 6402.5468, <2> 6402.5468, <3> 6402.5468;

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
